; DESCRIPTION: Places a purple 43x86 rectangle at position (393, 143).
; PLAN: r0=393(x), r1=143(y), r2=43(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 143
LDI r2, 43
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
