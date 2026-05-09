; DESCRIPTION: Places a red 87x111 rectangle at position (284, 65).
; PLAN: r0=284(x), r1=65(y), r2=87(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 65
LDI r2, 87
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
