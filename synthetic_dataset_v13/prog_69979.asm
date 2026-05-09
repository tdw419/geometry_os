; DESCRIPTION: Draws a magenta line from (488, 228) to (337, 42).
; PLAN: r0=488(x1), r1=228(y1), r2=337(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 228
LDI r2, 337
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
