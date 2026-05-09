; DESCRIPTION: Draws a cyan line from (254, 197) to (487, 180).
; PLAN: r0=254(x1), r1=197(y1), r2=487(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 197
LDI r2, 487
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
