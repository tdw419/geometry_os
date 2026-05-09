; DESCRIPTION: Places a yellow 42x60 rectangle at position (275, 171).
; PLAN: r0=275(x), r1=171(y), r2=42(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 171
LDI r2, 42
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
