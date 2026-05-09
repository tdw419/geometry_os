; DESCRIPTION: Renders a cyan line between points (502, 148) and (502, 206).
; PLAN: r0=502(x1), r1=148(y1), r2=502(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 148
LDI r2, 502
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
