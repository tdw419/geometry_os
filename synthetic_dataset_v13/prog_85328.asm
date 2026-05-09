; DESCRIPTION: Places a magenta 34x72 rectangle at position (297, 143).
; PLAN: r0=297(x), r1=143(y), r2=34(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 143
LDI r2, 34
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
