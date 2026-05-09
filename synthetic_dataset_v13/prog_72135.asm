; DESCRIPTION: Places a magenta 104x103 rectangle at position (224, 125).
; PLAN: r0=224(x), r1=125(y), r2=104(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 125
LDI r2, 104
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
