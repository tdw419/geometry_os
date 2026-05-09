; DESCRIPTION: Places a magenta 111x16 rectangle at position (368, 120).
; PLAN: r0=368(x), r1=120(y), r2=111(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 120
LDI r2, 111
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
