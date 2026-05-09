; DESCRIPTION: Renders a magenta line between points (187, 243) and (479, 60).
; PLAN: r0=187(x1), r1=243(y1), r2=479(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 243
LDI r2, 479
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
