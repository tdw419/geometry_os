; DESCRIPTION: Places a yellow 72x64 rectangle at position (421, 169).
; PLAN: r0=421(x), r1=169(y), r2=72(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 169
LDI r2, 72
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
