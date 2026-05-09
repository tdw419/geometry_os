; DESCRIPTION: Draws a cyan line from (469, 42) to (206, 92).
; PLAN: r0=469(x1), r1=42(y1), r2=206(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 42
LDI r2, 206
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
