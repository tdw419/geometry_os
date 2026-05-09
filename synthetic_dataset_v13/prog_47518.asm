; DESCRIPTION: Draws a white line from (479, 209) to (500, 214).
; PLAN: r0=479(x1), r1=209(y1), r2=500(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 209
LDI r2, 500
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
