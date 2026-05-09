; DESCRIPTION: Places a white 27x87 rectangle at position (156, 146).
; PLAN: r0=156(x), r1=146(y), r2=27(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 146
LDI r2, 27
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
