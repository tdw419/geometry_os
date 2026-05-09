; DESCRIPTION: Draws a cyan line from (177, 55) to (346, 42).
; PLAN: r0=177(x1), r1=55(y1), r2=346(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 55
LDI r2, 346
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
