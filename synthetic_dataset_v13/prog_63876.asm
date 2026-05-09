; DESCRIPTION: Places a blue 27x39 rectangle at position (367, 107).
; PLAN: r0=367(x), r1=107(y), r2=27(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 107
LDI r2, 27
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
