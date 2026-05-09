; DESCRIPTION: Composite: Creates a green circular shape at (146, 87) with radius 57 then Renders a cyan box of size 104x69 starting at (380, 152).
; PLAN: r0=146(x), r1=87(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=152(y), r7=104(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 87
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 152
LDI r7, 104
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
