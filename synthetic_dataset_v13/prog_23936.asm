; DESCRIPTION: Places a white 103x60 rectangle at position (50, 174).
; PLAN: r0=50(x), r1=174(y), r2=103(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 174
LDI r2, 103
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
