; DESCRIPTION: Draws a cyan line from (42, 223) to (373, 27).
; PLAN: r0=42(x1), r1=223(y1), r2=373(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 223
LDI r2, 373
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
