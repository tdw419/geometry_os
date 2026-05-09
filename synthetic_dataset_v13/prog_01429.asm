; DESCRIPTION: Draws a cyan line from (500, 226) to (280, 210).
; PLAN: r0=500(x1), r1=226(y1), r2=280(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 226
LDI r2, 280
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
