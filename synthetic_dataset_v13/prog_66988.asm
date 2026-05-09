; DESCRIPTION: Draws a cyan line from (50, 170) to (198, 239).
; PLAN: r0=50(x1), r1=170(y1), r2=198(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 170
LDI r2, 198
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
