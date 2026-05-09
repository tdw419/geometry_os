; DESCRIPTION: Draws a magenta line from (479, 131) to (327, 252).
; PLAN: r0=479(x1), r1=131(y1), r2=327(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 131
LDI r2, 327
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
