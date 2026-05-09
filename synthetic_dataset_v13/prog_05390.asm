; DESCRIPTION: Draws a cyan line from (481, 168) to (168, 36).
; PLAN: r0=481(x1), r1=168(y1), r2=168(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 168
LDI r2, 168
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
