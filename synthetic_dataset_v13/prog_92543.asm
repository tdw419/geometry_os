; DESCRIPTION: Places a red 30x38 rectangle at position (307, 169).
; PLAN: r0=307(x), r1=169(y), r2=30(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 169
LDI r2, 30
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
