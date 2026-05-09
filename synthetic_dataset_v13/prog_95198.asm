; DESCRIPTION: Places a red 112x71 rectangle at position (195, 171).
; PLAN: r0=195(x), r1=171(y), r2=112(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 171
LDI r2, 112
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
