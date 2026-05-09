; DESCRIPTION: Draws a cyan line from (466, 72) to (502, 215).
; PLAN: r0=466(x1), r1=72(y1), r2=502(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 72
LDI r2, 502
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
