; DESCRIPTION: Draws a cyan line from (284, 3) to (389, 182).
; PLAN: r0=284(x1), r1=3(y1), r2=389(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 3
LDI r2, 389
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
