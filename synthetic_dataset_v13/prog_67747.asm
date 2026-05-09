; DESCRIPTION: Composite: Places a red 106x116 rectangle at position (330, 17) then Places a cyan line segment connecting (310, 134) to (264, 104).
; PLAN: r0=330(x), r1=17(y), r2=106(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x1), r6=134(y1), r7=264(x2), r8=104(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 17
LDI r2, 106
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 134
LDI r7, 264
LDI r8, 104
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
