; DESCRIPTION: Renders a cyan line between points (69, 255) and (329, 197).
; PLAN: r0=69(x1), r1=255(y1), r2=329(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 255
LDI r2, 329
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
