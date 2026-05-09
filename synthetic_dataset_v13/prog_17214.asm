; DESCRIPTION: Composite: Renders a cyan box of size 12x66 starting at (465, 72) then Renders a blue line between points (130, 161) and (213, 18).
; PLAN: r0=465(x), r1=72(y), r2=12(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=161(y1), r7=213(x2), r8=18(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 72
LDI r2, 12
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 161
LDI r7, 213
LDI r8, 18
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
