; DESCRIPTION: Draws a cyan line from (255, 254) to (409, 161).
; PLAN: r0=255(x1), r1=254(y1), r2=409(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 254
LDI r2, 409
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
