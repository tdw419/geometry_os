; DESCRIPTION: Draws a cyan line from (284, 164) to (396, 93).
; PLAN: r0=284(x1), r1=164(y1), r2=396(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 164
LDI r2, 396
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
