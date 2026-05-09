; DESCRIPTION: Draws a cyan line from (42, 8) to (340, 208).
; PLAN: r0=42(x1), r1=8(y1), r2=340(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 8
LDI r2, 340
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
