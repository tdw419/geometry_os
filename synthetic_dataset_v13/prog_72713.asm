; DESCRIPTION: Draws a cyan line from (416, 239) to (236, 88).
; PLAN: r0=416(x1), r1=239(y1), r2=236(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 239
LDI r2, 236
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
