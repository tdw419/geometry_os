; DESCRIPTION: Draws a cyan line from (120, 203) to (294, 228).
; PLAN: r0=120(x1), r1=203(y1), r2=294(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 203
LDI r2, 294
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
