; DESCRIPTION: Sets the background to red.
; PLAN: r0=0xFF0000(color). Op: FILL r0.
LDI r0, 0xFF0000
FILL r0
HALT
