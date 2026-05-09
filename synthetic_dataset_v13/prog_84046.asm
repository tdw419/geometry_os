; DESCRIPTION: Renders a cyan line between points (284, 65) and (20, 6).
; PLAN: r0=284(x1), r1=65(y1), r2=20(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 65
LDI r2, 20
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
