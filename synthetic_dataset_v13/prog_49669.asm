; DESCRIPTION: Draws a blue line from (435, 88) to (295, 50).
; PLAN: r0=435(x1), r1=88(y1), r2=295(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 88
LDI r2, 295
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
