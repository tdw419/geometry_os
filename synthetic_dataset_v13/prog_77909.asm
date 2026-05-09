; DESCRIPTION: Places a yellow 34x63 rectangle at position (408, 143).
; PLAN: r0=408(x), r1=143(y), r2=34(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 143
LDI r2, 34
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
