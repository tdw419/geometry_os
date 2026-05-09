; DESCRIPTION: Draws a cyan line from (467, 234) to (168, 237).
; PLAN: r0=467(x1), r1=234(y1), r2=168(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 234
LDI r2, 168
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
