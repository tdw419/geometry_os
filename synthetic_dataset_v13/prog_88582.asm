; DESCRIPTION: Composite: Places a green 65x104 rectangle at position (76, 0) then Draws a cyan line from (305, 109) to (368, 250).
; PLAN: r0=76(x), r1=0(y), r2=65(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x1), r6=109(y1), r7=368(x2), r8=250(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 0
LDI r2, 65
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 109
LDI r7, 368
LDI r8, 250
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
