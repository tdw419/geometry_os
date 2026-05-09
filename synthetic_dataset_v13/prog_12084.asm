; DESCRIPTION: Composite: Renders a white box of size 38x67 starting at (123, 9) then Draws a cyan line from (130, 115) to (310, 85).
; PLAN: r0=123(x), r1=9(y), r2=38(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=115(y1), r7=310(x2), r8=85(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 9
LDI r2, 38
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 115
LDI r7, 310
LDI r8, 85
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
