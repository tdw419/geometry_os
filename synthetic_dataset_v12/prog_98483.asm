; DESCRIPTION: Draws a cyan line from (75, 173) to (42, 72).
; PLAN: r0=75(x1), r1=173(y1), r2=42(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 173
LDI r2, 42
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
