; DESCRIPTION: Places a yellow 92x10 rectangle at position (42, 209).
; PLAN: r0=42(x), r1=209(y), r2=92(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 209
LDI r2, 92
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
