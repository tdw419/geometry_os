; DESCRIPTION: Draws a cyan line from (42, 134) to (178, 86).
; PLAN: r0=42(x1), r1=134(y1), r2=178(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 134
LDI r2, 178
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
