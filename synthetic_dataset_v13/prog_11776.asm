; DESCRIPTION: Places a blue 62x112 rectangle at position (391, 143).
; PLAN: r0=391(x), r1=143(y), r2=62(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 143
LDI r2, 62
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
