; DESCRIPTION: Draws a white line from (295, 122) to (471, 27).
; PLAN: r0=295(x1), r1=122(y1), r2=471(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 122
LDI r2, 471
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
