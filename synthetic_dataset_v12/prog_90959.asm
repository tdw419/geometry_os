; DESCRIPTION: Draws a cyan line from (285, 205) to (360, 178).
; PLAN: r0=285(x1), r1=205(y1), r2=360(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 205
LDI r2, 360
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
