; DESCRIPTION: Places a yellow 57x71 rectangle at position (374, 167).
; PLAN: r0=374(x), r1=167(y), r2=57(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 167
LDI r2, 57
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
