; DESCRIPTION: Places a green 96x42 rectangle at position (182, 193).
; PLAN: r0=182(x), r1=193(y), r2=96(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 193
LDI r2, 96
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
