; DESCRIPTION: Draws a cyan line from (329, 168) to (284, 237).
; PLAN: r0=329(x1), r1=168(y1), r2=284(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 168
LDI r2, 284
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
