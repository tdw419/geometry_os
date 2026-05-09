; DESCRIPTION: Places a orange 111x103 rectangle at position (269, 83).
; PLAN: r0=269(x), r1=83(y), r2=111(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 83
LDI r2, 111
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
