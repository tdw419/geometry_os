; DESCRIPTION: Places a green 43x24 rectangle at position (328, 143).
; PLAN: r0=328(x), r1=143(y), r2=43(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 143
LDI r2, 43
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
