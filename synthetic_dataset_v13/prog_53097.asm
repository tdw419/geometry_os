; DESCRIPTION: Sets the background to blue.
; PLAN: r0=0x0000FF(color). Op: FILL r0.
LDI r0, 0x0000FF
FILL r0
HALT
