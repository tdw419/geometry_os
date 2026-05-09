; DESCRIPTION: Places a red 72x111 rectangle at position (435, 1).
; PLAN: r0=435(x), r1=1(y), r2=72(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 1
LDI r2, 72
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
