; DESCRIPTION: Places a blue 27x86 rectangle at position (466, 146).
; PLAN: r0=466(x), r1=146(y), r2=27(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 146
LDI r2, 27
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
