; DESCRIPTION: Places a yellow 71x73 rectangle at position (320, 183).
; PLAN: r0=320(x), r1=183(y), r2=71(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 183
LDI r2, 71
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
