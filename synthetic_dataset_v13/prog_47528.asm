; DESCRIPTION: Draws a cyan line from (263, 79) to (473, 32).
; PLAN: r0=263(x1), r1=79(y1), r2=473(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 79
LDI r2, 473
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
